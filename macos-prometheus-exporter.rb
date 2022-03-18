class MacosPrometheusExporter < Formula
  desc "A MacOS WiFi and power metrics Prometheus exporter"
  homepage "https://github.com/DanielLeone/macos-prometheus-exporter"
  url "https://github.com/DanielLeone/macos-prometheus-exporter/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "fbbe12ed66cdfdb3333e9bc2c33acc463e27cb33c79ae8cc948d52c16ae7b11e"
  license "Apache-2.0"

  depends_on "go" => :build

  service do
    run "#{bin}/macos_prometheus_exporter"
    keep_alive true
    error_log_path "#{var}/log/macos_prometheus_exporter.log"
    log_path "#{var}/log/macos_prometheus_exporter.err.log"
  end

  def caveats
    <<~EOS
      The launchd service runs on http://127.0.0.1:9003. Logs are located at #{var}/log/macos_prometheus_exporter.log
    EOS
  end

  def install
    system "./build.sh", "#{bin}/macos_prometheus_exporter"
  end
end
