from os.path import join

#algorithm list
algorithms = ["MyInDegree", "MyOutDegree", "MySSSP", "MySSSP_GSA", "MyPagerank", "MyWCC", "MyWCC_GSA", "MyCommunityDetection", "MyLCC"]

#workers upper bound
number_of_workers = 3

#list of datasets
datasets = ["small"]

#input_directory
input_dir = "hdfs://master:9100/user/datasets"

#ouput directory
output_dir = "hdfs://master:9100/user/outputs"

#time directory
time_dir = "/home/user/measurements/gelly_measurements"

#logs directory
logs_dir = join(time_dir, "gelly_measurement_logs")

#command fstring
gelly_str = "./flink-1.14.5/bin/flink run -p {} gelly-algorithms/target/gelly-algorithms-1.0-SNAPSHOT.jar hdfs://master:9100/user/datasets/small hdfs://master:9100/user/outputs/{} {}"

def print_to_file(f_argument, command_str_arg, run_name_arg):
    #this function
    f_argument.write("echo '" + run_name_arg + " began' >> " + logs_dir)
    f_argument.write("\n")
    f_argument.write(command_str_arg)
    f_argument.write("\n")
    f_argument.write("echo '" + run_name_arg + " ended' >> " + logs_dir)
    f_argument.write("\n\n")


if __name__ == "__main__":
    #open file
    f = open('run_all_gelly.sh', 'w+')

    for dataset in datasets:

        #for every algorithm
        for algo in algorithms:
            #create input path without suffix
            input_param = join(input_dir,dataset) #for example: hdfs://master:9000/user/datasets/small (!without .e or .v suffix)

            #for the different values of -w parameter
            for i in range(1,number_of_workers+1):
                run_name = dataset + "_" + algo.lower()[2:] + "_" + str(i) #the name of the locally stored text file that will save this measurement
                time_file = join(time_dir,run_name) #the path of the measurement, for example: /home/user/measurements/giraph_measurements/small_bfs_2

                output_name =  run_name + "_" + "results" #the name of the hdfs text file that will save the output
                output_param = join(output_dir,output_name) #the hdfs path of the output, for example: hdfs://master:9000/user/outputs/small_bfs_2

                command_str = "(time " + gelly_str.format(i, output_param, algo) + ") 2> " + time_file
                print_to_file(f,command_str,run_name)

    #close file
    f.close()
