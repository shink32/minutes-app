import consumer from "./consumer"

consumer.subscriptions.create("ContentChannel", {
  connected() {
    console.log("connect!")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
  // 新しいP要素を用意します．
  var list = document.getElementById("list");
  var node = document.createElement("p"); 
  // 受信したメッセージを変数に入れます．
  // var textnode = document.createTextNode(data.content.writing); 
  // テキストノードを新規作成したP要素に追加します．
  // node.appendChild(textnode); 


  const HTML = `
  <div class="content_post" data-id=${data.content.id}>
    <div class="post-name">
      ${data.content.id}
    </div>
    <div class="post-content">
      ${data.content.writing}
    </div>
    <div class="post-date">
      ${data.content.created_at}
    </div>
    <div class="message-image">
     ${data.content.images}
    </div>`;
  list.insertAdjacentHTML("afterend", HTML);

  // DOM に新しく作られた要素とその内容を追加します 
  document.getElementById("new_message").appendChild(node);
  // フォームの中身を空にします
  document.getElementById('content').value= ''
  }
});


