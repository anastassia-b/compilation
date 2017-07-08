const MessageStore = require('./message_store');

module.exports = {
  renderForm() {
    let currentMessage = MessageStore.getMessageDraft();
    let html = `

    `;
    return html;
  },
  render() {
    let container = document.createElement("div");
    container.className = "new-message";
    container.innerHTML = this.renderForm();

    return container;
  }
};
