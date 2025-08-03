function wallpaper_loop --description 'Cycle through wallpapers from a directory in random order every 3 seconds'
    set wallpaper_dir /home/ori/Wallpapers
    
    while true
        # Collect image files from the directory and prefix each with a comma
        set wallpapers
        for file in (find $wallpaper_dir -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | sort)
            set wallpapers $wallpapers ,$file
        end
        
        # Skip loop if no wallpapers found
        if test (count $wallpapers) -eq 0
            echo "No wallpapers found in $wallpaper_dir"
            break
        end
        
        # Shuffle wallpapers using Fisher–Yates
        set shuffled $wallpapers
        for i in (seq (count $shuffled) -1 2)
            set j (math (random) % $i + 1)
            set temp $shuffled[$i]
            set shuffled[$i] $shuffled[$j]
            set shuffled[$j] $temp
        end
        
        # Display each wallpaper using reload
        for wp in $shuffled
            hyprctl hyprpaper reload $wp
            sleep 240
        end
    end
end
