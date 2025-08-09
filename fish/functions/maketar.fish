function maketar
    # Usage & argument checks
    if test (count $argv) -ne 2
        echo "Usage: maketar <destination-archive.tar.gz> <source-directory>"
        return 1
    end
    set -l dest $argv[1]
    set -l src  $argv[2]
    if not test -d "$src"
        echo "Error: Source directory not found: $src"
        return 1
    end
    if not string match -rq '\.tar\.gz$' -- "$dest"
        set dest "$dest.tar.gz"
    end
    
    # === Data dumps (structured) ===
    set -l ex '*.csv' '*.npy' '*.npz'
    # === Secrets & credentials ===
    set -a ex '*.env' '.env.*' '*.pem' '*.key' '*.crt' 'secrets'
    # === Logs & noise ===
    set -a ex '*.log'
    # === VCS & caches ===
    set -a ex '.git' '__pycache__'
    # === Dependencies (JS/Rust/Python/C/C++) ===
    set -a ex 'node_modules' 'target' '.venv' 'venv' 'env' 'build' 'cmake-build-*' 'out'
    # === Databases ===
    set -a ex '*.sqlite' '*.db'
    # === Spreadsheets ===
    set -a ex '*.xls' '*.xlsx' '*.xlsm' '*.xlsb' '*.ods'
    # === Documents & presentations ===
    set -a ex '*.pdf' '*.doc' '*.docx' '*.dot' '*.dotx' '*.ppt' '*.pptx' '*.pps' '*.ppsx' '*.odp' '*.odt'
    # === Images (common + RAW + vector + special) ===
    set -a ex '*.jpg' '*.jpeg' '*.png' '*.gif' '*.bmp' '*.tif' '*.tiff' '*.webp' '*.heic' '*.heif' '*.avif'
    set -a ex '*.svg' '*.svgz' '*.ico' '*.icns' '*.eps' '*.psd' '*.xcf' '*.ai' '*.indd' '*.raw'
    set -a ex '*.cr2' '*.cr3' '*.nef' '*.nrw' '*.arw' '*.orf' '*.rw2' '*.dng' '*.pef' '*.sr2' '*.bay'
    # === DIG extension ===
    set -a ex '*.dig'
    
    # Build --exclude args
    set -l args
    for p in $ex
        set args $args "--exclude=$p"
    end
    
    # Excludes must appear before the source path
    tar -czvf "$dest" $args "$src"
end
