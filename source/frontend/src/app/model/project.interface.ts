import { Technology } from "./technology.interface"

export interface Project {
    id: number;
    title: string;
    codemonkey: string;
    company: string;
    technologies: Technology[];
    status: string;
    description: string | null;
    suggestion_time: Date;
    start_time: Date | null;
    end_time: Date | null;
    rating: number | null;
    comment: string | null;
}