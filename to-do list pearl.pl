use strict;  
use warnings;  

my @todo_list;

sub display_menu {
    print "\nTo-Do List Application\n";  
    print "1. Add Task\n";  
    print "2. View Tasks\n";  
    print "3. Delete Task\n";  
    print "4. Exit\n";  
    print "Choose an option: ";  
}

sub add_task {
    print "Enter the task you want to add: ";  
    my $task = <STDIN>;  
    chomp($task);  
    push @todo_list, $task;  
    print "Task added: $task\n";  
}

sub view_tasks {
    if (@todo_list) {  
        print "Your To-Do List:\n";  
        for my $index (0 .. $#todo_list) {  
            print "$index: $todo_list[$index]\n";  
        }
    } else {
        print "Your to-do list is empty.\n";  
    }
}

sub delete_task {
    view_tasks();  
    print "Enter the index of the task you want to delete: ";  
    my $index = <STDIN>;  
    chomp($index);  
    if (defined $todo_list[$index]) {  
        my $removed_task = splice(@todo_list, $index, 1);  
        print "Task deleted: $removed_task->[0]\n";  
    } else {
        print "Invalid index. Please try again.\n";  
    }
}

while (1) {  
    display_menu(); 
    my $choice = <STDIN>;  #
    chomp($choice);
    if ($choice == 1) {
        add_task();  
    } elsif ($choice == 2) {
        view_tasks();  
    } elsif ($choice == 3) {
        delete_task();  
    } elsif ($choice == 4) {
        print "Exiting the application. Goodbye!\n"; 
        last;  
    } else {
        print "Invalid choice. Please select a valid option.\n";  
    }
}