const plugin = require("tailwindcss/plugin");
const colors = require("tailwindcss/colors");


module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/*_web.ex",
    "../lib/*_web/**/*.*ex"
  ],
  theme: {
    extend: {
      backgroundImage: {
         
        'header-background': "url('/images/footer-bg.jpg')",
        'light-green-topo-bg':"url('/images/light-green-topographical-background.jpg')",
        'bg-arch-cul-closeup': "url('/images/telegraph-arch-closeup.jpg')",
        'bg-lidar-1': "url('/images/lidar_01.png')",
        'bg-lidar-2': "url('/images/lidar_02.png')",
        'bg-lidar-3': "url('/images/lidar_03.png')",
        'bg-lidar-4': "url('/images/lidar_04.png')",
        'bg-lidar-dark': "url('/images/lidar_dark.png')"

      },
      colors: {

        primary: colors.teal,
        secondary: colors.teal,
        brand: "#8dcbca",

        'mc-vdark-teal': '#014053',
        'mc-dark-teal': '#055259',
        'mc-med-teal': '#00958f',
        'mc-light-teal': '#8dcbca',
        'mc-vlite-teal': '#aac1c0',
        'mc-dark-green': '#529636',
        'mc-med-green': '#9cd090',
        'mc-light-green': '#91b779',
        'mc-dark-mustard': '#8ea02b',
        'mc-med-mustard': '#b7cb3a',
        
        } 
      } ,    
    },
  
  plugins: [
    require("@tailwindcss/forms"),
    plugin(({addVariant}) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"]))
  ]
}