$(function(){
  $('#link-mark').on('click', function(){
    $.ajax({
      url: '/likes',
      type: 'POST',
      data: {shop_id: $(this).data('shop_id')}
    })
    .done((data) => {
      if ($(this).text() === 'いいね！') {
        $(this).toggleClass('いいね！を取り消す');
      } else if ($(this).text() === 'いいね！を取り消す') {
        $(this).text('いいね！');
      }
    })
    .fail((data) => {
      alert('いいね！に失敗しました');
    })
  });
});