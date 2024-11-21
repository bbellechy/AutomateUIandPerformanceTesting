import { check } from 'k6';
import http from 'k6/http';

export let options = {
  stages: [
    { duration: '1m', target: 50 },  // Ramp up to 50 users
    { duration: '30s', target: 200 }, // Spike up to 200 users
    { duration: '1m', target: 50 },   // Ramp down to 50 users
    { duration: '1m', target: 0 },    // Ramp down to 0 users
  ],
};

export default function () {
  const res = http.get('http://45.136.236.146:8081/');
  check(res, {
    'is status 200': (r) => r.status === 200,
  });
}
