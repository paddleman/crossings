import L from "leaflet";

const CustomIcon = L.Icon.extend({
  options: {
    iconSize: [6, 6],
    // shadowSize:   [50, 64],
    // iconAnchor:   [22, 94],
    shadowAnchor: [3, 3],
    // popupAnchor:  [-3, -76]
  },
});

const svgRect =
  "<svg xmlns='http://www.w3.org/2000/svg'><rect x='0' y='0' width='20' height='20' fill='#5a7cd2' /></svg>";
const svgCirc =
  "<svg xmlns='http://www.w3.org/2000/svg'><circle cx='25' cy='25' r='50' fill='#00958f' /></svg>";

var url_rect = "data:image/svg+xml," + encodeURIComponent(svgRect);
var url_circ = "data:image/svg+xml," + encodeURIComponent(svgCirc);
var rectIcon = new CustomIcon({ iconUrl: url_rect });
var circleIcon = new CustomIcon({ iconUrl: url_circ });

class BaseMap {
  constructor(element, center, markerClickedCallback) {
    this.map = L.map(element).setView(center, 5);

    L.tileLayer(
      'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
      {
        attribution:
          '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors ',
        subdomains: "abcd",
        maxZoom: 20,
      },
    ).addTo(this.map);

    this.markerClickedCallback = markerClickedCallback;
  }

  addMarker(xing) {
    let xing_marker = L.marker(
      [xing.lat, xing.lng],
      {
        icon: circleIcon,
        crossingId: xing.id,
      });

    xing_marker.addTo(this.map);
    xing_marker.bindPopup(xing.id);

    xing_marker.on("click", e => {
      xing_marker.openPopup();
      this.markerClickedCallback(e);
    });

    return xing_marker;
  }
}

export default BaseMap;
