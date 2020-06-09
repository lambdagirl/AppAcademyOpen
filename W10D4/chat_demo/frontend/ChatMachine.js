var ChatMachine = function($el){
  this.$messages = $el.find("ul");
  this.$form = $el.find("form");
  this.$form.on("submit", this.submitMessage.bind(this));
};

//an event handler for "this.$form.on("submit")
ChatMachine.prototype.submitMessage = function(e){
  e.preventDefault();
  $.ajax({
    method: "POST",
    url: "./messages.json",
    datatype: "json",
    data: this.$form.serialize(),
    success: function(message){
      this.addMessage(message);
      this.clearForm();
    }.bind(this)
  });
};

ChatMachine.prototype.addMessage = function (message){
      const $message = $("<li>").text(message.author + ": " + message.text);
      this.$messages.append($message);
};

ChatMachine.prototype.clearForm = function(){
  this.$form.find("input[type='text']").val("");
}

module.exports = ChatMachine;
