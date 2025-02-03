// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin");
const fs = require("fs");
const path = require("path");
const colors = require("tailwindcss/colors");

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/crossings_web.ex",
    "../lib/crossings_web/**/*.*ex",
  ],
  theme: {
    extend: {
      backgroundImage: {
        "header-background": "url('/images/footer-bg.jpg')",
        "light-green-topo-bg":
          "url('/images/light-green-topographical-background.jpg')",
        "lidar-1": "url('/images/lidar_01.png')",
        "lidar-2": "url('/images/lidar_02.png')",
        "lidar-3": "url('/images/lidar_03.png')",
        "lidar-4": "url('/images/lidar_04.png')",
        "lidar-dark": "url('/images/lidar_dark.png')",
      },
      colors: {
        primary: colors.teal,
        secondary: colors.teal,
        brand: "#8dcbca",

        "mc-vdark-teal": "#014053",
        "mc-dark-teal": "#055259",
        "mc-med-teal": "#00958f",
        "mc-light-teal": "#8dcbca",
        "mc-vlite-teal": "#aac1c0",
        "mc-dark-green": "#529636",
        "mc-med-green": "#9cd090",
        "mc-light-green": "#91b779",
        "mc-dark-mustard": "#8ea02b",
        "mc-med-mustard": "#b7cb3a",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({ addVariant }) =>
      addVariant("phx-click-loading", [
        ".phx-click-loading&",
        ".phx-click-loading &",
      ]),
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-submit-loading", [
        ".phx-submit-loading&",
        ".phx-submit-loading &",
      ]),
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-change-loading", [
        ".phx-change-loading&",
        ".phx-change-loading &",
      ]),
    ),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized");
      let values = {};
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"],
      ];
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach((file) => {
          let name = path.basename(file, ".svg") + suffix;
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) };
        });
      });
      matchComponents(
        {
          hero: ({ name, fullPath }) => {
            let content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, "");
            let size = theme("spacing.6");
            if (name.endsWith("-mini")) {
              size = theme("spacing.5");
            } else if (name.endsWith("-micro")) {
              size = theme("spacing.4");
            }
            return {
              [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              "-webkit-mask": `var(--hero-${name})`,
              mask: `var(--hero-${name})`,
              "mask-repeat": "no-repeat",
              "background-color": "currentColor",
              "vertical-align": "middle",
              display: "inline-block",
              width: size,
              height: size,
            };
          },
        },
        { values },
      );
    }),
  ],
};
