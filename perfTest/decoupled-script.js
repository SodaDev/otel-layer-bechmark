import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  // A number specifying the number of VUs to run concurrently.
  vus: 10,
  stages: [
    { duration: '30s', target: 20 },
    { duration: '1m30s', target: 10 },
    { duration: '20s', target: 5 },
  ],
};

export default function() {
  http.get('https://xwq2cyxsxveq6235jaaxdqwpxm0sdonj.lambda-url.eu-west-1.on.aws/');
  sleep(1);
}
