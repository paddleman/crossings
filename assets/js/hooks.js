let Hooks = {};

Hooks.BaseMap = {
  mounted() {
    this.map = new BaseMap(this.el, [53.5, -124.5], event => {
      const crossingInfo = {
        crossingId: event.target.options.crossingId
        // structureType: event.target.options.structType
      }


      this.pushEvent("marker-clicked", crossingInfo, (reply, ref) => {
        console.log(reply.crossing.id);
      });
    });
  }
}

export default Hooks;
