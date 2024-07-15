//= require jquery
//= require jquery_ujs

import Rails from "@rails/ujs";
import "@hotwired/turbo-rails"
import "controllers"


Rails.start();
Turbo.session.drive = true

const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
Rails.ajax.csrfToken = csrfToken;
