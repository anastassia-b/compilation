class Router {
  constructor (node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start () {
    this.render();
    window.addEventListener("hashchange", () => {
      this.render();
    });
  }

  activeRoute () {
    let hash = window.location.hash.substr(1);
    let component = this.routes[hash];
    return component;
  }

  render() {
    this.node.innerHTML = "";
    let component = this.activeRoute();
    if(component) {
      this.node.appendChild(component.render());
    }
  }

}

module.exports = Router;
