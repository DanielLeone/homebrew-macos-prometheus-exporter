class MacosPrometheusExporter < Formula
  desc "A MacOS WiFi and power metrics Prometheus exporter"
  homepage ""
  url "https://github.com/DanielLeone/macos-prometheus-exporter/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "d038798e952f893c77ad1f5af8cf75f4f5f5e40cd2b142911036edbca4a6e665"
  license "Apache-2.0"

  service do
    run bin / "macos_prometheus_exporter"
    keep_alive true
    log_path "/usr/local/var/log/macos_prometheus_exporter.log"
    error_log_path "/usr/local/var/log/macos_prometheus_exporter.err.log"
  end

  def install
    bin.install "main" => "macos_prometheus_exporter"
  end
end
