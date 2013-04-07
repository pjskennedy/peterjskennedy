class Cell
  constructor: (val, back) ->
    @val   = val
    @back  = back
    @ideal = false
    this

class Personal.Views.EditDistance extends Backbone.View

  template:    JST['apps/edit_distance/main']
  tabletemplate: JST['apps/edit_distance/table']

  events:
    'click #edit-distance-button': 'calculateEditDistance'

  render: () ->
    $(@el).html(@template())
    this

  reverse: (s) ->
    s.split("").reverse().join("")


  calculateEditDistance: ->

    #
    # Notes:
    #
    # L -> refers to the item at the x-1, y location
    #      ie, left
    # U -> refers to the item at the x, y-1 location
    #      ie, up
    # D -> refers to the item at the x-1, y-1 location
    #      ie, diagonal
    #
  
    strx        = $("#str1").val();
    strx_length = strx.length;

    stry        = $("#str2").val();
    stry_length = stry.length;

    ed_matrix   = new Array(stry_length);

    # Set up the array and fill in the first row 
    # and first column

    for i in [0..stry_length] by 1
      ed_matrix[i]    = new Array(strx_length+1);
      ed_matrix[i][0] = new Cell(i, "U");

    for i in [1..strx_length] by 1
      ed_matrix[0][i] = new Cell(i, "L");
  
    # Construct Array
    for y in [1..stry_length] by 1
      for x in [1..strx_length] by 1

        left = ed_matrix[y][x-1].val + 1
        up   = ed_matrix[y-1][x].val + 1
        diag = ed_matrix[y-1][x-1].val + (strx[x-1] != stry[y-1])


        # This by default will accept the left
        # then up, before it takes the diagonal
        # on the chance of a tie.

        if ( left <= up && left <= diag)
          ed_matrix[y][x] = new Cell( left, "L")
        else if ( up <= diag )
          ed_matrix[y][x] = new Cell( up,   "U")
        else 
          ed_matrix[y][x] = new Cell( diag, "D")


    y = stry_length
    x = strx_length

    updated_y = "";
    updated_x = "";

    ed_matrix[0][0].ideal = true;

    while ( y > 0 or x > 0 ) 

      ed_matrix[y][x].ideal = true;

      switch ed_matrix[y][x].back
    
        when "U"
          updated_x += "-";
          updated_y += stry[--y];
          break;

        when "L"
          updated_x += strx[--x];
          updated_y += "-";
          break;

        when "D"
          updated_x += strx[--x];
          updated_y += stry[--y];
          break;

    $("#edit-distance-table-container").html(
      @tabletemplate(
        model: ed_matrix, 
        old_str1: strx, 
        new_str1: @reverse(updated_x), 
        old_str2: stry, 
        new_str2: @reverse(updated_y) 
      )
    )

    # Prepare data for garbage collection so browsers don't collapse
    ed_matrix = null
    updated_x = null
    updated_y = null
    strx      = null
    stry      = null
