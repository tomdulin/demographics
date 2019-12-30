Population = {
  init: function () {
    if ($('#population_year').length > 0) {
      $('#population_year').on('keyup', function () {
        Population.assess_year()
      })
    }
  },
  assess_year: function () {
    if (Population.population_year() > Population.max_known_year()) {
      $('#hidden_calc').slideDown()
    } else {
      $('#hidden_calc').slideUp()
    }
  },
  population_year: function () {
    return parseInt($('#population_year').val())
  },
  max_known_year: function () {
    return parseInt($('#max_known').val())
  }
}

$(document).on('turbolinks:load', function () {
  Population.init()
})
