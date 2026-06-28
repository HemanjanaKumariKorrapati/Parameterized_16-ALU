call "C:\Users\Hema\Downloads\oss-cad-suite\environment.bat"
set VERILATOR_ROOT=C:\Users\Hema\Downloads\oss-cad-suite\share\verilator
verilator_bin.exe --lint-only rtl\alu.v > lint\lint_report.txt 2>&1