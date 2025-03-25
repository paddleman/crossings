 
import L from "leaflet";
import colours from "./colours";

class BaseMap {
  constructor(element, center, markerClickedCallback) {
    this.map = L.map(element).setView(center, 8);

    L.tileLayer(
      "https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",
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
      const crossingIcon = L.divIcon({
        className: setClassName(xing),
        iconSize: [6, 6],
      });
  
      let xing_marker = L.marker([xing.lat, xing.lng], {
        icon: crossingIcon,
        crossingId: xing.id,
        crossingServiceAreaName: xing.service_area_name,
        crossingServiceAreaNumber: xing.service_area_number,
      });
  
      xing_marker.addTo(this.map);
      xing_marker.bindPopup(xing.service_area_name);
  
      xing_marker.on("click", (e) => {
        xing_marker.openPopup();
        this.markerClickedCallback(e);
      });
  
      return xing_marker;
    }
  
}

export default BaseMap;

function setClassName(c) {
  if (c.service_area_number = 1 ) {
    return "active-natural";
  } else  {
    return "discontinued-natural";
  }
}

function setIconSize(s) {
  // if (s.hyd_status == "A" && s.regulated == false && s.record_length > 5) {
  //   return [10, 10];
  // } else if (
  //   s.hyd_status == "A" &&
  //   s.regulated == true &&
  //   s.record_length > 5
  // ) {
  //   return [8, 8];
  // } else if (
  //   s.hyd_status == "D" &&
  //   s.regulated == false &&
  //   s.record_length > 5
  // ) {
  //   return [10, 10];
  // } else if (
  //   s.hyd_status == "D" &&
  //   s.regulated == true &&
  //   s.record_length > 5
  // ) {
  //   return [8, 8];
  // } else {
    return [6, 6];
  }
