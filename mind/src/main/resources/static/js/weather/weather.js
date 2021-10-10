/**
 * 
 */
function lb_dropdowns() {
  $('select').each(function (i, select) {
    if (!$(this).next().hasClass('lb-dropdown-select-city')) {
      $(this).after('<div class="lb-dropdown-select-city wide ' + ($(this).attr('class') || '') + '" tabindex="0"><span class="current"></span><div class="list"><ul></ul></div></div>');
      var dropdown = $(this).next();
      var options = $(select).find('option');
      var selected = $(this).find('option:selected');
      dropdown.find('.current').html(selected.data('display-text') || selected.text());
      options.each(function (j, o) {
      var display = $(o).data('display-text') || '';
      dropdown.find('ul').append('<li class="option ' + ($(o).is(':selected') ? 'selected' : '') + '" data-value="' + $(o).val() + '" data-display-text="' + display + '">' + $(o).text() + '</li>');
      });
    }
  });
  
  $('.lb-dropdown-select-city ul').before('<div class="lbdsc-search"><input id="txtSearchValue" autocomplete="off" onkeyup="filter()" class="lbdsc-searchbox" type="text"></div>');
}

$(document).on('click', '.lb-dropdown-select-city', function (event) {
  if($(event.target).hasClass('lbdsc-searchbox')){
    return;
  }
  $('.lb-dropdown-select-city').not($(this)).removeClass('open');
  $(this).toggleClass('open');
  if ($(this).hasClass('open')) {
    $(this).find('.option').attr('tabindex', 0);
    $(this).find('.selected').focus();
  } else {
    $(this).find('.option').removeAttr('tabindex');
    $(this).focus();
  }
});

$(document).on('click', function (event) {
  if ($(event.target).closest('.lb-dropdown-select-city').length === 0) {
    $('.lb-dropdown-select-city').removeClass('open');
    $('.lb-dropdown-select-city .option').removeAttr('tabindex');
  }
  event.stopPropagation();
});

function filter(){
  var valThis = $('#txtSearchValue').val();
  $('.lb-dropdown-select-city ul > li').each(function(){
    var text = $(this).text();
    (text.toLowerCase().indexOf(valThis.toLowerCase()) > -1) ? $(this).show() : $(this).hide();
  });
};

$(document).on('click', '.lb-dropdown-select-city .option', function (event) {
  $(this).closest('.list').find('.selected').removeClass('selected');
  $(this).addClass('selected');
  var text = $(this).data('display-text') || $(this).text();
  $(this).closest('.lb-dropdown-select-city').find('.current').text(text);
  $(this).closest('.lb-dropdown-select-city').prev('select').val($(this).data('value')).trigger('change');
});

$(document).on('keydown', '.lb-dropdown-select-city', function (event) {
  var focused_option = $($(this).find('.list .option:focus')[0] || $(this).find('.list .option.selected')[0]);
  if (event.keyCode == 13) {
    if ($(this).hasClass('open')) {
      focused_option.trigger('click');
    } else {
      $(this).trigger('click');
    }
    return false;
  } else if (event.keyCode == 40) {
    if (!$(this).hasClass('open')) {
      $(this).trigger('click');
    } else {
      focused_option.next().focus();
    }
    return false;
  } else if (event.keyCode == 38) {
    if (!$(this).hasClass('open')) {
      $(this).trigger('click');
    } else {
      var focused_option = $($(this).find('.list .option:focus')[0] || $(this).find('.list .option.selected')[0]);
      focused_option.prev().focus();
    }
    return false;
  } else if (event.keyCode == 27) {
    if ($(this).hasClass('open')) {
      $(this).trigger('click');
    }
    return false;
  }
});

$(document).ready(function () {
  lb_dropdowns();
});

//첫번째 날씨 위젯
$('.lb-weather').hide();
$('#lb-1').show();
$('#select-box').change(function () {
  dropdown = $('#select-box').val();
  $('.lb-weather').hide();
  $('#' + "lb-" + dropdown).show();                                    
});

jQuery( function() {
  jQuery( '#background' ).YTPlayer();
});

$(document).ready(function() {
  var obj = document.createElement("audio");
  obj.src = "https://drive.google.com/uc?export=download&id=1I6hVwfFKn-rs_8LuxVDwz5M7wLbWQ-CC";
  obj.volume = 0.3;
  obj.autoPlay = true;
  obj.preLoad = true;
  obj.controls = true;
  obj.loop = 1;

  $(".beom").click(function() {
    obj.play();
  });
});

//30초 마다 새로고침
$(document).ready(function () {
  setTimeout(
    function () {
      window.location.reload(1);
    },
    300000
  );
});
