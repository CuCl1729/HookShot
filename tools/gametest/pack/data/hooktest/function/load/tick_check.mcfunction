execute if score #tick hook.temporary matches 1.. run say HOOKTEST load.tick_runs PASS
execute unless score #tick hook.temporary matches 1.. run say HOOKTEST load.tick_runs FAIL hook:tick is not running
