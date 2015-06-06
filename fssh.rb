require "formula"

class Fssh < Formula
  desc "Forward SSH - Reverse ssh wrapper for Linux X11/Mac OS X copy-paste buffer"
  homepage "https://github.com/kylemanna/fssh"
  head "https://github.com/kylemanna/fssh.git"

  def install
    %w[fssh ui_copy ui_paste].each { |f| bin.install f }
  end

  test do
    ssh_output_message = "ssh executed"
    (testpath/"ssh").write <<-EOS.undent
      #!/bin/sh
      echo #{ssh_output_message}
    EOS
    chmod 0755, testpath/"ssh"
    ENV.prepend_path "PATH", testpath
    assert_match /^#{ssh_output_message}$/, shell_output("fssh")
  end
end
