cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/share/veriwell-2.8.7/bin
export HOME=/home/runner
veriwell design.sv testbench.sv  ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip