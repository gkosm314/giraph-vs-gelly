from os.path import join

#algorithm list
algorithms = ["MyInDegree", "MyOutDegree", "MyBFS", "MySSSP", "MyPagerank", "MyWCC", "MyCommunityDetection", "MyLCC"]

#algorithm-t-vif mapping /-vif parameter
vector_input_format = {
    "MyInDegree" : "LongLongDoubleTextInputFormat",
    "MyOutDegree" : "LongLongDoubleTextInputFormat",
    "MyBFS" : "LongLongDoubleTextInputFormat",
    "MySSSP" : "LongDoubleDoubleTextInputFormat",
    "MyPagerank" : "LongDoubleDoubleTextInputFormat",
    "MyWCC" : "LongLongDoubleTextInputFormat",
    "MyCommunityDetection" : "LongLongDoubleTextInputFormat",
    "MyLCC" : "LongDoubleDoubleTextInputFormat"
}

#algorithm-to-combiner mapping
combiner = {
    "MyInDegree" : "MyLongSumMessageCombiner",
    "MySSSP" : "MinimumLongDoubleMessageCombiner",
    "MyPagerank" : "MyDoubleSumMessageCombiner",
}

#workers upper bound
number_of_workers = 3

#list of datasets / -eip & -vip parameter
datasets = ["small","large"]

#input_directory
input_dir = "hdfs://master:9000/user/datasets"

#ouput directory
output_dir = "hdfs://master:9000/user/outputs"

#time directory
time_dir = "/home/user/measurements/giraph_measurements"

#logs directory
logs_dir = join(time_dir, "giraph_measurement_logs")

#command fstring
giraph_str = "giraph $GIRAPH_HOME/giraph-examples-1.3.0-hadoop1.jar org.apache.giraph.examples.{} -w {} -eif org.apache.giraph.io.formats.DirectedLongDoubleTextEdgeInputFormat -vif org.apache.giraph.io.formats.{} -vof org.apache.giraph.io.formats.IdWithValueTextOutputFormat -eip {}.e -vip {}.v -op {}"


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
    f = open('run_all_giraph.sh', 'w+')

    for dataset in datasets:

        #for every algorithm
        for algo in algorithms:
            vif_param = vector_input_format[algo] #the input format of this algorithm
            input_param = join(input_dir,dataset) #for example: hdfs://master:9000/user/datasets/small (!without .e or .v suffix)

            #for the different values of -w parameter
            for i in range(1,number_of_workers+1):
                run_name = dataset + "_" + algo.lower()[2:] + "_" + str(i) #the name of the locally stored text file that will save this measurement
                time_file = join(time_dir,run_name) #the path of the measurement, for example: /home/user/measurements/giraph_measurements/small_bfs_2

                output_name =  run_name + "_" + "results" #the name of the hdfs text file that will save the output
                output_param = join(output_dir,output_name) #the hdfs path of the output, for example: hdfs://master:9000/user/outputs/small_bfs_2

                command_str = "(time " + giraph_str.format(algo,i,vif_param,input_param,input_param,output_param) + ") 2> " + time_file
                print_to_file(f,command_str,run_name)

                #if the algorithm can use a combiner, repeat the above process but run with the appropriate combiner
                if algo in combiner:
                    run_name_with_comb = run_name + "_with_combiner"
                    time_file_with_comb = join(time_dir,run_name_with_comb)

                    output_name_with_comb =  run_name_with_comb + "_" + "results"
                    output_param_with_comb = join(output_dir,output_name_with_comb)

                    combiner_str = " -c org.apache.giraph.combiner." + combiner[algo] #the -c parameter for giraph. this will be appended to the giraph_str
                    command_str_with_comb = "(time " + giraph_str.format(algo,i,vif_param,input_param,input_param,output_param_with_comb) + combiner_str + ") 2> " + time_file_with_comb
                    print_to_file(f,command_str_with_comb,run_name_with_comb)

    #close file
    f.close()
