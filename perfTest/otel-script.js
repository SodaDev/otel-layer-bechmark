import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  // A number specifying the number of VUs to run concurrently.
  vus: 10,
  stages: [
    { duration: '30s', target: 10 },
    // { duration: '30s', target: 5 },
    // { duration: '20s', target: 1 },
  ],
};

export default function() {
  http.get('https://kvqowqg3x5gtwzo6kbz7zvvc5u0alnqd.lambda-url.eu-west-1.on.aws/');
  sleep(0);
}
