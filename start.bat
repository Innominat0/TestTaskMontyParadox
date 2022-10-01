@echo Testing...
echo.
call rspec spec/testTaskMonty_spec.rb
echo.
@echo Running simulation program... 
echo.
call ruby testTaskMonty.rb
pause
