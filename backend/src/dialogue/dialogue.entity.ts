import { Entity, PrimaryGeneratedColumn, Column, OneToMany, ManyToOne, JoinColumn } from 'typeorm';
import { User } from '../user/user.entity'; // Убедитесь, что путь к User импортирован правильно
import { Message } from '../message/message.entity'; // Убедитесь, что путь к Message импортирован правильно

@Entity()
export class Dialogue {
    @PrimaryGeneratedColumn()
    dialogue_id: number;

    @ManyToOne(() => User, { onDelete: 'CASCADE' })
    @JoinColumn({ name: 'first_user_email' })
    first_user: User;

    @ManyToOne(() => User, { onDelete: 'CASCADE' })
    @JoinColumn({ name: 'second_user_email' })
    second_user: User;

    @Column('datetime', { default: () => 'CURRENT_TIMESTAMP' })
    creation_time: Date;

    @OneToMany(() => Message, (message) => message.dialogue, { cascade: true })
    messages: Message[];
}