function wallpaper_loop --description 'Cycle through wallpapers every 3 seconds'
    set wallpapers \
                ",/home/ori/Wallpapers/66bfdbf3e3a106572bc235afbeb63123.jpg" \
                ",/home/ori/Wallpapers/8765cfec07cc1f96bc0da27b0bc0f841.jpg" \
                ",/home/ori/Wallpapers/1751962858675477.jpg" \
                ",/home/ori/Wallpapers/blue-eyes-cute-teen-girl-on.jpg" \
                ",/home/ori/Wallpapers/qiandaiyiyu-Anime-Artist-artist-8679195.jpeg" \
                ",/home/ori/Wallpapers/Warhammer-40000-фэндомы-sisters-of-battle-9011298.jpeg" \
                ",/home/ori/Wallpapers/rainy-road-serenade-anime-girl-in-the-wet-urban-glow-3f.jpg" \
                ",/home/ori/Wallpapers/koleda-belobog-Zenless-Zone-Zero-Игры-8978991.jpeg" \
                ",/home/ori/Wallpapers/91406-arts-games-anime-girls-anime-tamamo-destinys.webp" \
                ",/home/ori/Wallpapers/Ayase-Seiko-Dandadan-Anime-9019685.jpeg" \
                ",/home/ori/Wallpapers/Stable-diffusion-нейронные-сети-Tatsumaki-7846003.jpeg"
    
    for wp in $wallpapers
        hyprctl hyprpaper wallpaper $wp
        sleep 3
    end
end
