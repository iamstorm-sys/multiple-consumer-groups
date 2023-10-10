# multiple-consumer-groups
With this node app, you can create multiple consumer-groups for a Redpanda-cluster

# SET-UP

1. clone the repository
2. install the packages
    ```
    yarn install
    ```
3. add the execute permissions to index.js & ignite.sh, with following commands, using your terminal
    ```
    chmod +x index.js
    chmod +x ignite.js
    ```
4. Replace the metadata.broker.list value, in index.js
    ```
    const consumer = new KafkaConsumer({
        'group.id': groupID,
        'metadata.broker.list': 'localhost:19092', // Replace with your Redpanda broker addresses
        'enable.auto.commit': false, // Set to true to enable auto-commit if needed
    });
    ```
5. Replace the topic 'beautiful-tuesday' with your topic name, in index.js
    ```
    consumer.on('ready', () => {
        consumer.subscribe(['beautiful-tuesday']); 
        // Replace with the topics you want to subscribe to,
        // you can also add other topics as well as a comma-sparated list
    });
    ```

# USAGE    
1. start the script, in the root directory of this app
    ```
    ./ignite.sh <amount of instances | integer> <prefix for consumers>
    ```
    example
    ```
    ./ignite.sh 3 group

    # the first argument (3) represents the number of consumer-group instances for a topic, we want to be live
    # With less number of consumer-groups, cleanup will become easy. Recommended (5)
    # the second argument (group) represents the prefix, which the script use to create multiple consumers-groups
    ```
2. To check the outputs, you can visit 'output.log'

# Prerequisites
1. make sure your cluster is live, else the script will result into an error
    If there is any unusual behaviour, you can check the 'yarn-error.log' file

# Clean-up
Close the terminals via ctrl + c, after finish working with consumer-groups, 

