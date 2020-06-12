import http from 'k6/http';
import {
  check,
  sleep
} from 'k6';

export let options = {
  vus: 500,
  duration: '3m',
};

export default function () {
  let res = http.get(`http://${__ENV.HOST}:30076/chamadaApi`);
  check(res, {
    'status was 200': r => r.status == 200,
    'transaction time OK': r => r.timings.duration < 200,
  });
  console.log(res.status)
  sleep(1);
}