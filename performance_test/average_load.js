import { check } from 'k6';
import http from 'k6/http';

export let options = {
  stages: [
    { duration: '5m', target: 50 }, // ramp-up to 50 users over 5 minutes
    { duration: '10m', target: 50 }, // stay at 50 users for 10 minutes
    { duration: '5m', target: 0 },  // ramp-down to 0 users
  ],
};

export default function () {
  const res = http.get('http://45.136.236.146:8081/');
  check(res, {
    'is status 200': (r) => r.status === 200,
  });
}
