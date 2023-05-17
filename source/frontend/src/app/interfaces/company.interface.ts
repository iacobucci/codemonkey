import { User } from './user.interface';
import { Technology } from './technology.interface';

export interface Company extends User {
    type: "Company";
    name: string;
    bio: string;
    technologies: Technology[];
}
