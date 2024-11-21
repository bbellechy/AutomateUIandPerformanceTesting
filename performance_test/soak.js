import { check } from 'k6';
import http from 'k6/http';

export let options = {
  stages: [
    { duration: '1h', target: 50 }, 
  ],
};

export default function () {
  const res = http.get('http://45.136.236.146:8081/');
  check(res, {
    'is status 200': (r) => r.status === 200,
  });
}
