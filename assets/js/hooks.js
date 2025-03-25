import BaseMap from "./base_map";

let Hooks = {};

Hooks.BaseMap = {

  mounted() {
    this.map = new BaseMap(this.el, [49.5, -125.5], event => {
      const crossingInfo = { 
        crossingId: event.target.options.crossingId
      };      
      
      this.pushEvent("marker-clicked", crossingInfo, (reply, ref) => {
        console.log(reply.crossing.id);
      });
    
    });

    this.pushEvent("get-crossings", {}, (reply, ref) => {
      reply.crossings.forEach(crossing => {
        this.map.addMarker(crossing);
      });
    }); 
  
  }
};
export default Hooks;
