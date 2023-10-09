const { KafkaConsumer } = require('node-rdkafka');

const groupID = process.argv[2];
console.log(groupID)
const consumer = new KafkaConsumer({
    'group.id': groupID,
    'metadata.broker.list': 'localhost:19092', // Replace with your Redpanda broker addresses
    'enable.auto.commit': false, // Set to true to enable auto-commit if needed
});


consumer.connect();

consumer.on('ready', () => {
    consumer.subscribe(['beautiful-tuesday']); // Replace with the topics you want to subscribe to
});


consumer.on('data', (message) => {
    // Handle incoming messages here
    console.log(`Received message: ${message.value.toString()}`);
});


consumer.on('data', (message) => {
    // Handle incoming messages here

    // Commit the offset
    consumer.commitMessage(message);
});

consumer.on('event.error', (err) => {
    console.error('Error from consumer:', err);
});


process.on('SIGINT', () => {
    console.log('Closing consumer...');
    consumer.disconnect();
});
