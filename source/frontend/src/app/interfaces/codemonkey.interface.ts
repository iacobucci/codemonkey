import { User } from './user.interface';
import { Technology } from './technology.interface';

export interface Codemonkey extends User{
  first_name: string;
  last_name: string;
  bio: string;
  rating: number;
  technologies: Technology[];
}