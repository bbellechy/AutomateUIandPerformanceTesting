import { check } from 'k6';
import http from 'k6/http';

export let options = {
  stages: [
    { duration: '2m', target: 50 },  // ramp-up to 50 users
    { duration: '2m', target: 100 }, // ramp-up to 100 users
    { duration: '2m', target: 150 }, // ramp-up to 150 users
    { duration: '2m', target: 200 }, // ramp-up to 200 users
    { duration: '5m', target: 200 }, // stay at 200 users
  ],
};

export default function () {
  const res = http.get('http://45.136.236.146:8081/');
  check(res, {
    'is status 200': (r) => r.status === 200,
  });
}
