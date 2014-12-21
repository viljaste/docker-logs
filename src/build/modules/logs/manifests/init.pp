class logs {
  require logs::packages
  require logs::dockergen
  require logs::fluentd
  require logs::elasticsearch
  require logs::kibana
}
