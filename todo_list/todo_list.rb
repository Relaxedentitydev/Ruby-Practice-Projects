tasks = []

def display_menu
  puts "\n--- To-Do List Menu ---"
  puts "1. Add a task"
  puts "2. View all tasks"
  puts "3. Remove a task"
  puts "4. Exit"
  print "Choose an option: "
end

def add_task(tasks)
  puts "Enter task description"
  task = gets.chomp
  tasks << task
  puts "Task added!"
end

def view_tasks(tasks)
  puts "\n--- To-Do List ---"
  if tasks.empty?
    puts "No tasks found."
  else
    tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end
end

def remove_task(tasks)
  if tasks.empty?
    puts "No tasks to remove"
    return
  end

  puts "Enter the number of the task to remove: "
  task_number = gets.chomp.to_i

  if task_number.between?(1,tasks.size)
    removed_task = tasks.delete_at(task_number - 1)
    puts "Task '#{removed_task}' removed!"
  else
    puts "Invalid task number."
  end
end

loop do
  display_menu
  choice = gets.chomp.to_i

  case choice
   when 1
     add_task(tasks)
   when 2
     view_tasks(tasks)
   when 3
     remove_task(tasks)
   when 4
     puts "Exiting the application. Goodbye!"
     break
   else
     puts "Invalid choice. Please try again."
   end
 end
