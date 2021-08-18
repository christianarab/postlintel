import 'bootstrap/dist/js/bootstrap';
import 'bootstrap/dist/css/bootstrap';
import 'stylesheets/application';
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
