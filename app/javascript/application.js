// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"
import "recurring_select"

RecurringSelectDialog.config.texts = {
    locale_iso_code: "it",
    repeat: "Ripeti",
    frequency: "Frequenza",
    daily: "Giornaliero",
    weekly: "Settimanale",
    monthly: "Mensile",
    yearly: "Annuale",
    every: "Ogni",
    days: "giorno(i)",
    weeks_on: "settimana(e) on",
    months: "mese(i)",
    years: "anno(i)",
    first_day_of_week: 1,
    day_of_month: "Giorno del mese",
    day_of_week: "Giorno della settimana",
    cancel: "Cancella",
    ok: "OK",
    days_first_letter: ["D", "L", "Mar", "Mer", "G", "V", "S"],
    order: ["1", "2", "3", "4", "5", "Ultimo"],
  };
