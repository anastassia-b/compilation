class Message {
  constructor(from = user, to = "", subject = "", body = "") {
    this.from = from;
    this.to = to;
    this.subject = subject;
    this.body = body;
  }
}

const user = "email.anastassia@gmail.com";

let messages = JSON.parse(localStorage.getItem('messages'));
let messageDraft = new Message();

if(!messages) {
  messages = {
    sent: [
      {to: "friend@mail.com", subject: "Check this out!", body: "thought of you-"},
      {to: "mom@gmail.com", subject: "Still alive!", body: "Hi mom, I'm all good I love you"}
    ],
    inbox: [
      {from: "grandma@yahoo.com", subject: "Fwd: Fwd: Fwd: Hi", body: "Did you get the sweaters I sent?"},
      {from: "auto@linkup.com", subject: "Get Hired Fast!", body: "Anastassia, people are looking at"}
    ]
  };
}


const MessageStore = {
  getInboxMessages() {
    return messages.inbox.slice();
  },
  getSentMessages() {
    return messages.sent.slice();
  },
  getMessageDraft() {
    return messageDraft;
  },
  sendDraft() {
    messages.sent.push(messageDraft);
    messageDraft = new Message();
    localStorage.setItem('messages', JSON.stringify(messages));
  },
  updateDraftField(field, value) {
    messageDraft[field] = value;
  }
};

module.exports = MessageStore;
