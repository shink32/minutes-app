function memo() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    
    XHR.open("POST", "contents", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      console.log(XHR)
      const item = XHR.response.content;
      const name = XHR.response.user_name;
      const images = XHR.response.images;
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      const HTML = `
      <div class="content_post" data-id=${item.id}>
        <div class="post-name">
          ${name}
        </div>
        <div class="post-content">
          ${item.writing}
        </div>
        <div class="post-date">
          ${item.created_at}
        </div>
        <div class="message-image">
         ${item.images}
        </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener("load", memo);
