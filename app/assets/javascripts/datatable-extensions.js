$.extend(true, $.fn.dataTable.defaults, {
  "sDom": "<'row'<'col-sm-6'l><'col-sm-6'f>r>" + "t" + "<'row'<'col-sm-6'i><'col-sm-6'p>>",
  "oLanguage": {
    "sLengthMenu": "_MENU_ records per page"
  }
});

/* Default class modification */
$.extend($.fn.dataTableExt.oStdClasses, {
  "sWrapper": "dataTables_wrapper",
  "sFilter": "form-inline datatable-filter",
  "sFilterInput": "form-control datatable-search-input",
  "sLength": "form-inline datatable-length-select",
  "sLengthSelect": "form-control"
});

$.fn.dataTable.defaults.renderer = 'bootstrap';
$.fn.dataTable.ext.renderer.pageButton.bootstrap = function(settings, host, idx, buttons, page, pages) {
  var api = new $.fn.dataTable.Api(settings);
  var classes = settings.oClasses;
  var lang = settings.oLanguage.oPaginate;
  var btnDisplay, btnClass;

  var attach = function(container, buttons) {
    var i, ien, node, button;
    var clickHandler = function(e) {
      e.preventDefault();
      if (e.data.action !== 'ellipsis') {
        api.page(e.data.action).draw(false);
      }
    };

    for (i = 0, ien = buttons.length; i < ien; i++) {
      button = buttons[i];

      if ($.isArray(button)) {
        attach(container, button);
      } else {
        btnDisplay = '';
        btnClass = '';

        switch (button) {
          case 'ellipsis':
          btnDisplay = '&hellip;';
          btnClass = 'disabled';
          break;

          case 'first':
          btnDisplay = lang.sFirst;
          btnClass = button + (page > 0 ?
            '' : ' disabled');
          break;

          case 'previous':
          btnDisplay = lang.sPrevious;
          btnClass = button + (page > 0 ?
            '' : ' disabled');
          break;

          case 'next':
          btnDisplay = lang.sNext;
          btnClass = button + (page < pages - 1 ?
            '' : ' disabled');
          break;

          case 'last':
          btnDisplay = lang.sLast;
          btnClass = button + (page < pages - 1 ?
            '' : ' disabled');
          break;

          default:
          btnDisplay = button + 1;
          btnClass = page === button ?
          'active' : '';
          break;
        }

        if (btnDisplay) {
          node = $('<li>', {
            'class': classes.sPageButton + ' ' + btnClass,
            'aria-controls': settings.sTableId,
            'tabindex': settings.iTabIndex,
            'id': idx === 0 && typeof button === 'string' ? settings.sTableId + '_' + button : null
          })
          .append($('<a>', {
            'href': '#'
          })
          .html(btnDisplay)
          )
          .appendTo(container);

          settings.oApi._fnBindAction(
            node, {
              action: button
            }, clickHandler
            );
        }
      }
    }
  };

  attach(
    $(host).empty().html('<ul class="pagination"/>').children('ul'),
    buttons
  );
}
