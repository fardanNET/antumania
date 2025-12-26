<?php
session_start();
ini_set('display_errors', 1);
error_reporting(E_ALL);
require_once('routeros_api.class.php');

$configFile = 'config.json';
$defaultTabs = [
    'dashboard' => '', 'vouchers' => '', 'online' => '',
    'leases' => '', 'binding' => '', 'pendapatan' => '',
    'logs' => '', 'traffic' => '', 'setting' => ''
];

// Load Configuration
if (file_exists($configFile)) {
    $configData = json_decode(file_get_contents($configFile), true);
    $configData['scripts'] = array_merge($defaultTabs, $configData['scripts'] ?? []);
} else {
    $configData = ['store_name' => 'COMMANDER NET', 'scripts' => $defaultTabs];
}

// Helper Ikon
function getIcon($tab) {
    $icons = [
        'dashboard' => 'th-large', 'vouchers' => 'ticket-alt', 'online' => 'wifi',
        'leases' => 'network-wired', 'binding' => 'link', 'pendapatan' => 'wallet',
        'logs' => 'terminal', 'traffic' => 'chart-line', 'setting' => 'cog'
    ];
    return $icons[$tab] ?? 'circle';
}

// Login Handler
if (isset($_POST['login'])) {
    $_SESSION['mikrotik'] = ['ip' => $_POST['ip'], 'user' => $_POST['user'], 'pass' => $_POST['pass']];
    header("Location: index.php"); exit;
}
if (isset($_GET['action']) && $_GET['action'] == 'logout') {
    session_unset(); session_destroy(); header("Location: index.php"); exit;
}

if (!isset($_SESSION['mikrotik'])) {
    ?>
    <!DOCTYPE html><html><head><title>Login MIKHREMOTE</title><script src="https://cdn.tailwindcss.com"></script></head>
    <body class="bg-[#020617] flex items-center justify-center min-h-screen font-mono p-4">
        <form method="POST" class="bg-slate-900 p-8 rounded-3xl border border-slate-700 w-full max-w-sm shadow-2xl">
            <h1 class="text-white text-center text-2xl font-black mb-6 italic text-blue-500 tracking-tighter">MIKH<span class="text-white">REMOTE</span></h1>
            <input name="ip" placeholder="ROUTER IP" class="w-full bg-black/50 border border-slate-700 p-3 rounded-xl text-white mb-3 outline-none" required>
            <input name="user" placeholder="USERNAME" class="w-full bg-black/50 border border-slate-700 p-3 rounded-xl text-white mb-3 outline-none" required>
            <input name="pass" type="password" placeholder="PASSWORD" class="w-full bg-black/50 border border-slate-700 p-3 rounded-xl text-white mb-6 outline-none">
            <button name="login" class="w-full bg-blue-600 py-3 rounded-xl font-black text-white uppercase tracking-widest hover:bg-blue-500 transition-all">CONNECT</button>
        </form>
    </body></html>
    <?php exit;
}

$API = new RouterosAPI();
$tab = $_GET['tab'] ?? 'dashboard';

if ($API->connect($_SESSION['mikrotik']['ip'], $_SESSION['mikrotik']['user'], $_SESSION['mikrotik']['pass'])) {

    // --- ACTION HANDLER (DIPERBAIKI) ---
    if (isset($_GET['action'])) {
        $act = $_GET['action'];

        // Toggle Hotspot Start
        if ($act == 'hs_start') {
            $API->comm('/ip/hotspot/enable', [".id" => "0"]); // Mengaktifkan server index 0
            header("Location: index.php?tab=" . ($tab ?? 'dashboard')); exit;
        }
        // Toggle Hotspot Stop
        if ($act == 'hs_stop') {
            $API->comm('/ip/hotspot/disable', [".id" => "0"]); // Mematikan server index 0
            header("Location: index.php?tab=" . ($tab ?? 'dashboard')); exit;
        }
        // Voucher Gen
        if ($act == 'gen') {
            $qty = (int)$_GET['qty']; $lim = $_GET['limit']; $cmt = $_GET['comment'];
            for ($i = 1; $i <= $qty; $i++) {
                $code = substr(str_shuffle("23456789ABCDEFGHJKLMNPQRSTUVWXYZ"), 0, 5);
                $API->comm('/ip/hotspot/user/add', ['name'=>$code, 'password'=>$code, 'limit-uptime'=>$lim, 'comment'=>$cmt, 'profile'=>'default']);
            }
            header("Location: index.php?tab=vouchers"); exit;
        }
        // Delete User
        if ($act == 'del_user') { $API->comm('/ip/hotspot/user/remove', [".id" => $_GET['id']]); header("Location: index.php?tab=vouchers"); exit; }
        // Kick Online
        if ($act == 'kick') { $API->comm('/ip/hotspot/active/remove', [".id" => $_GET['id']]); header("Location: index.php?tab=online"); exit; }
        // Bypass Binding
        if ($act == 'bind') {
            $API->comm('/ip/hotspot/ip-binding/add', ['mac-address' => $_GET['mac'], 'type' => 'bypassed', 'comment' => $_GET['comment']]);
            header("Location: index.php?tab=binding"); exit;
        }
    }

    // SAVE CONFIGURATION
    if (isset($_POST['save_config'])) {
        $configData['store_name'] = $_POST['store_name'];
        foreach($defaultTabs as $k => $v) { $configData['scripts'][$k] = $_POST["script_$k"]; }
        file_put_contents($configFile, json_encode($configData, JSON_PRETTY_PRINT));
        header("Location: index.php?tab=setting"); exit;
    }

    // DATA FETCHING
    $router     = $API->comm('/system/resource/print')[0] ?? [];
    $users      = $API->comm('/ip/hotspot/user/print') ?? [];
    $online     = $API->comm('/ip/hotspot/active/print') ?? [];
    $leases     = $API->comm('/ip/dhcp-server/lease/print') ?? [];
    $bindings   = $API->comm('/ip/hotspot/ip-binding/print') ?? [];
    $logs       = $API->comm('/log/print') ?? [];
    $interfaces = $API->comm('/interface/print') ?? [];

} else {
    die("Koneksi Gagal! Pastikan API MikroTik (Port 8728) Aktif.");
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $configData['store_name'] ?> | Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background: #020617; color: #f1f5f9; font-family: 'JetBrains Mono', monospace; }
        ::-webkit-scrollbar { width: 5px; }
        ::-webkit-scrollbar-thumb { background: #1e293b; border-radius: 10px; }
    </style>
</head>
<body class="p-4 md:p-8">

    <header class="max-w-7xl mx-auto flex flex-col lg:flex-row justify-between items-center mb-10 gap-8">
        <h1 class="text-3xl font-black italic tracking-tighter uppercase text-blue-500">
            <?= $configData['store_name'] ?> <span class="text-white text-xs block not-italic font-normal tracking-widest opacity-50">By_Antumania</span>
        </h1>

        <nav class="flex flex-wrap justify-center gap-2 bg-slate-900/80 p-3 rounded-3xl border border-slate-700 shadow-2xl backdrop-blur-md">
            <?php foreach($defaultTabs as $k => $v): ?>
                <a href="?tab=<?= $k ?>"
                   class="px-6 py-3 rounded-2xl text-[10px] font-black uppercase tracking-tighter transition-all duration-300
                   <?= $tab==$k
                       ? 'bg-blue-600 text-white shadow-[0_0_20px_rgba(37,99,235,0.4)] scale-105 border-b-4 border-blue-800'
                       : 'text-slate-400 hover:bg-slate-800 hover:text-white border-b-4 border-transparent'
                   ?>">
                    <i class="fas fa-<?= getIcon($k) ?> mr-2"></i>
                    <?= $k ?>
                </a>
            <?php endforeach; ?>
            <a href="?action=logout" class="px-6 py-3 rounded-2xl text-[10px] font-black uppercase text-rose-500 hover:bg-rose-500/10 border-b-4 border-transparent transition-all">
                <i class="fas fa-power-off"></i>
            </a>
        </nav>
    </header>

    <main class="max-w-7xl mx-auto">
        <?php if($tab == 'setting'): ?>
            <form method="POST" class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <div class="bg-slate-900 p-6 rounded-3xl border border-slate-800 h-fit">
                    <h3 class="text-white font-black uppercase text-sm mb-4">Identity</h3>
                    <input name="store_name" value="<?= $configData['store_name'] ?>" class="w-full bg-black/50 border border-slate-700 p-4 rounded-2xl text-white mb-6 outline-none focus:border-blue-500 transition-all font-bold">
                    <button name="save_config" class="w-full bg-blue-600 py-4 rounded-2xl font-black uppercase text-white hover:bg-blue-500 shadow-lg shadow-blue-900/40">SAVE CONFIGURATION</button>
                </div>
                <div class="lg:col-span-2 bg-slate-900 p-6 rounded-3xl border border-slate-800">
                    <h3 class="text-white font-black uppercase text-sm mb-4">Inject Scripts</h3>
                    <div class="space-y-4 max-h-[600px] overflow-y-auto pr-2">
                        <?php foreach($configData['scripts'] as $slug => $content): ?>
                        <div class="bg-black/30 p-4 rounded-2xl border border-slate-800">
                            <label class="text-[10px] text-blue-500 uppercase font-black mb-2 block tracking-widest">Tab: <?= $slug ?></label>
                            <textarea name="script_<?= $slug ?>" rows="5" class="w-full bg-transparent border-none p-0 text-emerald-400 font-mono text-[11px] outline-none placeholder-slate-700" placeholder="Paste your script for <?= $slug ?> here..."><?= htmlspecialchars($content) ?></textarea>
                        </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </form>
        <?php else: ?>
            <div class="animate-in fade-in duration-500">
                <?php
                if(!empty($configData['scripts'][$tab])) {
                    // Script di tab setting akan dijalankan di sini
                    eval("?> " . $configData['scripts'][$tab]);
                } else {
                    echo '<div class="text-center py-40 opacity-10 font-black uppercase tracking-[1em] italic text-3xl">'.$tab.' Empty</div>';
                }
                ?>
            </div>
        <?php endif; ?>
    </main>

</body>
</html>