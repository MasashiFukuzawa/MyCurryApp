$(function(){
  $('#link-mark').on('click', function(){
    $.ajax({
      url: '/likes',
      type: 'POST',
      data: {shop_id: $(this).data('shop_id')}
    })
    .done((data) => {
      if ($(this).text() === 'いいね！') {
        $(this).text('いいね！を取り消す').removeClass('btn-primary').addClass('btn-secondary');
      } else if ($(this).text() === 'いいね！を取り消す') {
        $(this).text('いいね！').removeClass('btn-secondary').addClass('btn-primary');
      }
    })
    .fail((data) => {
      alert('いいね！に失敗しました');
    })
  });
});