restart -force -nowave
do wave.do
run 43 ns
force -deposit /test_bench/Sistema/registro/aux(10) 1
run 157 ns

