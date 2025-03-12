import BaseMap from "./base_map";

let Hooks = {};

Hooks.BaseMap = {
  mounted() {
    this.map = new BaseMap(this.el, [53.5, -124.5], event => {
      const crossingId = event.target.options.crossingId;
      // structureType: event.target.options.structType



      this.pushEvent("marker-clicked", crossingId, (reply, ref) => {
        console.log(reply.crossing.id);
      });
    });

    this.pushEvent("get-crossings", {}, (reply, ref) => {
      reply.crossings.forEach(crossing => {
        this.map.addMarker(crossing)
      })
    })

  }
}

export default Hooks;
