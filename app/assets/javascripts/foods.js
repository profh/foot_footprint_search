var app = window.app = {};
app.Foods = function() {
  this._input = $('#foods-search-txt');
  this._initAutocomplete();
};

app.Foods.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/search',
        appendTo: '#foods-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, item) {
    var markup = [
      '<span class="food">' + item.name + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.name);
    return false;
  }
};