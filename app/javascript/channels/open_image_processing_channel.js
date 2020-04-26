import consumer from "./consumer"

consumer.subscriptions.create("OpenImageProcessingChannel", {
  connected() {
    console.log("CONNECTED");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("DISCONNECTED");
  },

  received(data) {
    console.log("RECIEVED", data);
    if(data.status === "processed" && data.url){
      $(".loader").hide();
      $("#open_graph_image").attr("src", data.url);
      $("#open_graph_image").show();
    } else {
      $(".loader").hide();
      alert(`Something went wrong. ${data.message}`);
    }

    // Called when there's incoming data on the websocket for this channel
  }
});
