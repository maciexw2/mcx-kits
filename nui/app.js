function onChoose(id) {
  $(".box").hide();
  $(".title").hide();
  $(".choose-text").animate(
    {
      bottom: "45%",
    },
    400
  );
  setTimeout(() => {
    $(".choose-text").animate(
      {
        bottom: "-30%",
      },
      400
    );
    $(".box").show();
    $(".title").show();
  }, 4000);
  $.post(`https://${GetParentResourceName()}/${id}`);
}
$(document).ready(function () {
  window.addEventListener("message", (event) => {
    if (event.data.action == "SHOW_UI") {
      $(".container").animate({
        top: "50%",
      });
    } else {
      $(".container").animate({
        top: "-30%",
      });
    }
  });
});
function handleHideUIButton() {
  $(".container").animate({
    top: "-30%",
  });
  $.post(`https://${GetParentResourceName()}/closeui`);
}
